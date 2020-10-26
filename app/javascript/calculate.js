function calculate() {
  const itemPrice = document.getElementById("item-price");
  const taxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  itemPrice.addEventListener("keyup", () => {
    let itemPriceNum = Number(itemPrice.value);
    let taxPriceInt = Math.floor(itemPriceNum / 10);
    let profitInt = Math.floor(itemPriceNum * 9 / 10);
    taxPrice.innerHTML = taxPriceInt;
    profit.innerHTML = profitInt;
  });
}

window.addEventListener('load', calculate)