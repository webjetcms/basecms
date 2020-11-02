package models;

import helpers.ColumnLocator;

import java.util.HashMap;
import java.util.Map;

public class TableModel {


    private String tableXpath;
    private final String[] columnsNames;
    private final int numberOfColumns;
    private static final Map<String, ColumnLocator> _columnLocators = new HashMap<>();

    /**
     * Method to define table.
     * User enter table xpath and list of columns.
     * @param tableXpath patch to the table body
     * @param columns user set names of table columns
     */
    public TableModel(String tableXpath, String[] columns) {
        this.tableXpath = tableXpath;
        this.columnsNames = columns;
        this.numberOfColumns = columns.length;
        for (int i = 0; i < columns.length; i++) {
            ColumnLocator columnLocator = new ColumnLocator(columns[i]);
            columnLocator.setOrder(i + 1);
            _columnLocators.put(columns[i], columnLocator);
        }
    }

    public String getTableXpath() {
        return tableXpath;
    }

    public String[] getColumnsNames() {
        return columnsNames;
    }

    public int getNumberOfColumns() {
        return numberOfColumns;
    }

    /**
     *
     * @param column requested column
     * @param row requested row
     * @return string version of table cell xpath
     */
    public String getDataCellLocator(String column, int row) {
        int columnNumber = _columnLocators.get(column).getOrder();
        String cellXpath = String.format("/tr[%d]/td[%d]",row,columnNumber);
        return tableXpath +cellXpath;
    }
}
