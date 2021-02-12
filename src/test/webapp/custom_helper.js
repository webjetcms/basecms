const { Helper } = codeceptjs;

class CustomWebjetHelper extends Helper {

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
