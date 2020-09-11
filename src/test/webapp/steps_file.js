// in this file you can append custom step methods to 'I' object

module.exports = function() {
  return actor({

    // Define custom steps here, use 'this' to access default methods of I.
    // It is recommended to place a general 'login' function here.
    fillAreaField(area, generateRandomNum) {
      area.w = generateRandomNum(600);
      area.h = generateRandomNum(600);
      area.x = generateRandomNum(100);
      area.y = generateRandomNum(50);
      this.fillField({ id: "w" }, area.w);
      this.wait(2);
      this.fillField({ id: "h" }, area.h);
      this.wait(2);
      this.fillField({ id: 'x' }, area.x);
      this.wait(2);
      this.fillField({ id: 'y' }, area.y);
      this.wait(2);
    },

    seeAndClick(name) {
      this.see(name);
      this.click(name);
    }

  });
}
