const { I } = inject();

module.exports = {

    async baseTest(options) {

        const dataTable = options.dataTable;
        const customRequiredFields = options.requiredFields;

        const requiredFields = [];
        const columns = await I.getDataTableColumns(dataTable);
        const id = await I.getDataTableId(dataTable);
        options.id = id;
        let url = await I.grabCurrentUrl();
        let sharp = url.indexOf("#");
        if (sharp>0) url = url.substring(0, sharp);
        options.url = url;

        options.columnTypes = [];

        I.say("Datatable.id="+options.id+" url="+url);
        try {
            // Testovanie nazvov stlpcov
            columns.forEach(column => {
                //console.log(column);
                let required = false;
                let type = "text";

                if (typeof column.editor != "undefined" && column.editor.required===true) required = true;
                if (typeof column.editor != "undefined") type = column.editor.type;

                I.say("Detekujem stlpce, sTitle="+column.sTitle+" required="+required+" type="+type);

                options.columnTypes[column.sName] = type;

                if (column.sTitle && column.visibleOriginal===true) I.see(column.sTitle);
                if (required === true) requiredFields.push(column);
            });
        } catch(err) {
            throw err;
        }

        if (customRequiredFields) {
            await this.testRequiredFields(customRequiredFields, options);
        } else {
            // Pokial sa nezadefinuje customRequiredFields hlada property - required z columns v datatabulke a podla nej testuje
            const columnsRequiredFields = requiredFields.map(field => field.sName);
            await this.testRequiredFields(columnsRequiredFields, options);
        }

        return options;
    },

    /**
     * Metoda testuje povinne polia pre datatabulku
     * @param {string[]} requiredFields pole pre povinne polia
     */
    async testRequiredFields(requiredFields, options) {
        const startDate = new Date();
        const randomText = I.getRandomText();

        let container = options.container;
        if (typeof container == "undefined" || container==null) container = "";
        else container = container + " ";

        let containerModal = options.containerModal;
        if (typeof containerModal == "undefined" || containerModal==null) containerModal = "";
        else containerModal = containerModal + " ";

        let skipRefresh = false;
        if (typeof options.skipRefresh != "undefined") skipRefresh=options.skipRefresh;

        let testingData = {};
        /* Testovanie - pridavanie */
        I.say("Testovanie - pridavanie");
        I.dtWaitForLoader();
        I.click('.buttons-create', {css: container+'.dt-buttons'});
        I.dtWaitForEditor(options.id);

        /* Testovanie - custom createSteps funkcia */
        I.say("Testing createSteps: "+(typeof options.createSteps));
        if (typeof options.createSteps == "function") {
            options.createSteps(I, options);
        }

        I.click("Pridať", {css: containerModal+"div.DTE_Form_Buttons"});
        I.dtEditorWaitForLoader();
        requiredFields.forEach(field => {
            I.see("Povinné pole", `div.DTE_Field_Name_${field}`);
        });

        requiredFields.forEach((field, index) => {
            testingData[index] = `${field}-autotest-${randomText}`;
            I.say("setting testingData["+index+"]="+ testingData[index] );

            if ("quill" === options.columnTypes[field]) I.dtFillQuill(field, testingData[index]);
            else I.fillField(`#DTE_Field_${field}`, `${testingData[index]}`);

            I.click("Pridať", {css: containerModal+"div.DTE_Form_Buttons"});
            I.dtEditorWaitForLoader();
            if (index != requiredFields.length - 1) I.dontSee("Povinné pole", `#DTE_Field_${field}`);
        });
        options.testingData = testingData;

        //over, ze sa modal zatvoril/zaznam sa ulozil
        if (containerModal!="") I.dontSeeElement(containerModal);
        else I.dontSeeElement('div.modal');

        /* Testovanie - vyhladavanie */
        I.say("Testovanie - vyhladavanie");
        requiredFields.forEach((field, index) => {
            I.dtFilter(field, testingData[index]);
            I.see(testingData[index]);
            I.dtFilter(field, "");
        });

        /* Testovanie - uprava  */
        I.say("Testovanie - uprava");
        I.dtFilter(requiredFields[0], testingData[0]);

        I.click(container+"td.dt-select-td.sorting_1");
        I.click(container+"button.buttons-edit");
        I.dtWaitForEditor(options.id);

        /* Testovanie - custom editSteps funkcia */
        I.say("Testing editSteps: "+(typeof options.editSteps));
        if (typeof options.editSteps == "function") {
            options.editSteps(I, options);
        }

        requiredFields.forEach((field, index) => {
            I.say("getting testingData["+index+"]="+ testingData[index] +" type="+options.columnTypes[field]);

            if ("quill" === options.columnTypes[field]) I.dtFillQuill(field, testingData[index]+'-change');
            else I.fillField(`#DTE_Field_${field}`, testingData[index]+'-change');
        });

        I.click("Uložiť", containerModal+"div.DTE_Form_Buttons");
        I.dtEditorWaitForLoader();

        //over, ze sa modal zatvoril
        if (containerModal!="") I.dontSeeElement(containerModal);
        else I.dontSeeElement('div.modal');

        /* Testovanie - vyhladanie upraveneho zaznamu */
        I.say("Testovanie - vyhladanie upraveneho zaznamu");
        if (skipRefresh == false) I.refreshPage();
        I.wait(1);
        I.dtFilter(requiredFields[0], `${testingData[0]}-change`);
        I.dtWaitForLoader();
        I.see(`${testingData[0]}-change`, "div.dataTables_scrollBody");

        /* Testovanie - custom editSearchSteps funkcia */
        I.say("Testing editSearchSteps: "+(typeof options.editSearchSteps));
        if (typeof options.editSearchSteps == "function") {
            options.editSearchSteps(I, options);
        }

        /* Testovanie - custom beforeDelete funkcia */
        I.say("Testing beforeDeleteSteps: "+(typeof options.beforeDeleteSteps));
        if (typeof options.beforeDeleteSteps == "function") {
            options.beforeDeleteSteps(I, options);
        }

        /* Testovanie - zmazanie */
        I.say("Testovanie - zmazanie");
        if (skipRefresh==false) I.click(container+"td.dt-select-td.sorting_1");
        I.click(".buttons-remove", {css: container+'.dt-buttons'});
        I.waitForElement("div.DTE_Action_Remove");
        I.wait(1);
        I.click("Zmazať", "div.DTE_Action_Remove");
        I.dtFilter(requiredFields[0], `${testingData[0]}-change`);
        I.dontSee(`${testingData[0]}change`);

        await this.testAuditRecords(startDate.getTime(), testingData[0]);

        var perms = options.perms ? options.perms : null;
        I.say("perms="+perms);
        if (perms != null) {
            I.say("Calling dtCheckPerms");
            I.dtCheckPerms(perms, options.url);
        }
    },

    /**
     * Otestuje, ci sa zapisali auditne zaznamy
     * @param {*} startTime - zaciatocny datum testu (timestamp)
     * @param {*} description - popis, ktory sa bude vyhladavat
     */
    async testAuditRecords(startTime, description) {
        I.amOnPage("/admin/v9/apps/audit-search/");
        let formatted = I.formatDateTime(startTime);
        I.fillField({css: "input.dt-filter-from-createDate"}, formatted);
        //I.click({css: "button.dt-filtrujem-createDate"});
        I.fillField({css: "input.dt-filter-description"}, description);
        I.click({css: "button.dt-filtrujem-description"});
        I.dtWaitForLoader("#datatableInit_processing");
        //pause();
        let rows = await I.getTotalRows();
        //console.log(" mam rows=====", rows);
        I.assertAbove(rows+1, 3, "Nedostatocny pocet audit zaznamov");
    },

    /**
     * Ziska JSON property v objekte podla zadaneho mena, akcetupje aj nested property typu editorFields.groupCopyDetails
     * @param {*} obj
     * @param {*} path
     * @param {*} value
     */
    getJsonProperty(obj, path) {
        let schema = obj;  // a moving reference to internal objects within obj
        const pList = path.split('.');
        const len = pList.length;
        for (let i = 0; i < len - 1; i++) {
            const elem = pList[i];
            if (!schema[elem]) {
                schema[elem] = {}
            }
            schema = schema[elem];
        }
        return schema[pList[len - 1]];
    },

    /**
     * Otestuje import zo suboru zadaneho v options.file
     * @param {*} options
     */
    async importTest(options) {

        const dataTable = options.dataTable;
        const customRequiredFields = options.requiredFields;

        let requiredFields = [];
        const columns = await I.getDataTableColumns(dataTable);
        const id = await I.getDataTableId(dataTable);
        options.id = id;
        let url = await I.grabCurrentUrl();
        let sharp = url.indexOf("#");
        if (sharp>0) url = url.substring(0, sharp);
        options.url = url;
        I.say("Datatable.id="+options.id+" url="+url);
        try {
            // Testovanie nazvov stlpcov
            columns.forEach(column => {
                //console.log(column);
                let required = false;
                if (typeof column.editor != "undefined" && column.editor.required===true) required = true;
                I.say("Detekujem stlpce, sTitle="+column.sTitle+" required="+required);

                if (column.sTitle && column.visibleOriginal===true) I.see(column.sTitle);
                if (required === true) requiredFields.push(column);
            });
        } catch(err) {
            throw err;
        }

        if (customRequiredFields) requiredFields = customRequiredFields;
        else requiredFields = requiredFields.map(field => field.sName)

        let container = options.container;
        if (typeof container == "undefined" || container==null) container = "";
        else container = container + " ";

        let containerModal = options.containerModal;
        if (typeof containerModal == "undefined" || containerModal==null) containerModal = "";
        else containerModal = containerModal + " ";

        //over ze take data uz nemame, ak ano, padol predchadzajuci import
        options.rows.forEach(row => {
            for (var key in row) {
                let value = this.getJsonProperty(row, key);
                I.say("Iterating row, key="+key+" value="+value);
                I.dtFilter(key, value);
            }
            I.see("Nenašli sa žiadne vyhovujúce záznamy");
        });

        I.say("Importujem data");

        I.click("button[data-dtbtn=import]");
        I.waitForModal("datatableImportModal");

        I.attachFile('#insert-file', options.file);

        I.wait(2);

        I.click("#submit-import");

        I.waitForModalClose("datatableImportModal");
        I.dtWaitForLoader();

        //over ze sa zaznamy daju najst
        options.rows.forEach(row => {
            for (var key in row) {
                let value = this.getJsonProperty(row, key);
                I.say("Iterating row, key="+key+" value="+value);
                I.dtFilter(key, value);
                I.see(value, "div.dataTables_scrollBody");
            }
            I.dontSee("Nenašli sa žiadne vyhovujúce záznamy");
            I.see("Záznamy 1 až 1 z celkom 1");
        });

        //uprav data cez klasicky editor, dopln changed na vsetky povinne stlpce okrem updateBy stlpca
        I.say("Aktualizujem data changed by");
        I.refreshPage();
        options.rows.forEach(row => {
            for (var key in row) {
                let value = this.getJsonProperty(row, key);
                I.say("Iterating row, key="+key+" value="+value);
                I.dtFilter(key, value);
                I.see(value, "div.dataTables_scrollBody");
            }
            I.dontSee("Nenašli sa žiadne vyhovujúce záznamy");
            I.see("Záznamy 1 až 1 z celkom 1");

            I.click(container+"td.dt-select-td.sorting_1");
            I.click(container+"button.buttons-edit");
            I.dtWaitForEditor(options.id);

            requiredFields.forEach((field, index) => {
                //updateBy je vo formate nazov - field
                if (options.updateBy.indexOf(" - "+field)!=-1) return;
                I.click(`#DTE_Field_${field}`);
                I.appendField(`#DTE_Field_${field}`, '-change');
            });

            I.click("Uložiť", containerModal+"div.DTE_Form_Buttons");
            I.dtEditorWaitForLoader();

            I.see("-change", "div.dataTables_scrollBody");
            I.see("Záznamy 1 až 1 z celkom 1");
        });

        //sprav update podla stlpca
        I.say("Aktualizujem data importom");
        I.wait(2);
        I.refreshPage();
        I.wait(2);

        let updateBy = options.updateBy;
        I.click("button[data-dtbtn=import]");
        I.waitForModal("datatableImportModal");

        I.attachFile('#insert-file', options.file);
        I.wait(2);

        I.click("Aktualizovať existujúce záznamy");
        I.click({ css: "button[data-id=dt-settings-update-by-column]" });
        I.waitForElement(locate('div.dropdown-menu.show .dropdown-item').withText(updateBy), 5);
        I.click(locate('div.dropdown-menu.show .dropdown-item').withText(updateBy));
        I.wait(1);

        I.click("#submit-import");

        I.dtWaitForLoader();
        //toto je haluz, ale ak to tu nie je, tak sa zrazu zobrazi dialog pre vyber suboru
        I.wait(10);

        //over ze sa zaznamy daju najst a stale to je len jeden zaznam
        options.rows.forEach(row => {
            for (var key in row) {
                let value = this.getJsonProperty(row, key);
                I.say("Iterating row, key="+key+" value="+value);
                I.dtFilter(key, value);
                I.see(value, "div.dataTables_scrollBody");
                I.dontSee(value+"-change", "div.dataTables_scrollBody");
            }
            I.dontSee("Nenašli sa žiadne vyhovujúce záznamy");
            I.see("Záznamy 1 až 1 z celkom 1");
        });

        //zmaz zaznam
        I.refreshPage();
        I.say("Mazem naimportovane data");
        options.rows.forEach(row => {
            for (var key in row) {
                let value = this.getJsonProperty(row, key);
                I.say("Iterating row, key="+key+" value="+value);
                I.dtFilter(key, value);
                I.see(value, "div.dataTables_scrollBody");
            }
            //over, ze sa nasiel jeden zaznam
            I.see("Záznamy 1 až 1 z celkom 1");

            //oznac ho a zmaz
            I.click(container+"td.dt-select-td.sorting_1");
            I.click(".buttons-remove", {css: container+'.dt-buttons'});
            I.waitForElement("div.DTE_Action_Remove");
            I.wait(1);
            I.click("Zmazať", "div.DTE_Action_Remove");

            //over, ze sa nic nenaslo
            I.see("Nenašli sa žiadne vyhovujúce záznamy");
        });

    }
}
