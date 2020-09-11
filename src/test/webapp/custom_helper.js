const { Helper } = codeceptjs;

class CustomWebjetHelper extends Helper {

  /**
   * Metoda vrati stlpce vo formate .json
   * @param {string} dataTable objekt pre datatabulku
   */
  async getDataTableColumns(dataTable) {
    const { page } = this.helpers['Playwright'];
    const window = await page.evaluateHandle(() => window);
    const table = await window.getProperty(dataTable);
    const DATA = await table.getProperty('DATA');
    const columns = await DATA.getProperty('columns');
    const columnsToJson = await columns.jsonValue();
    try {
      if (columnsToJson) return columnsToJson;
    } catch(err) {
      console.log(err);
    }
  }

  /**
   * Metoda otestuje ci existuje na stranke element pokial ano klikne naneho.
   * @param {string} selector html element ktory sa ma testovat
   */
  async clickIfVisible(selector) {
    const helper = this.helpers['Playwright'];
    const numVisible = await helper.grabNumberOfVisibleElements(selector);

    try {
      if (numVisible) {
        return helper.click(selector) && true;
      } else {
        console.log(`Skipping operation, element ${selector} is not visible.`);
        return false;
      }
    } catch (err) {
      console.log(err);
    }
  }

  /**
   * Metoda na kontrolu inputov ci su spristupnene alebo nie
   * @param {string} selector HTML element na ktorom sa robi kontrola
   */
  async verifyDisabled(selector) {
    const helper = this.helpers['Playwright'];
    try {
      const isDisabled = await helper.grabAttributeFrom(selector, 'disabled');
      return isDisabled;
    } catch (err) {
        console.log(err);
    }
  }

}

module.exports = CustomWebjetHelper;
