package helpers;

import org.openqa.selenium.JavascriptExecutor;

import java.util.ArrayList;

@SuppressWarnings("rawtypes")
public class TableJSLocator extends BasePage {

    public ArrayList _columns;

    /**
     * Define list of dataTable columns.
     * @param tableName name of dataTable
     */
    public TableJSLocator(String tableName){
        _columns= (ArrayList) ((JavascriptExecutor) driver).executeScript("return "+tableName+".settings().init().columns");
    }
}