function calculate() {
  const itemPrice = document.getElementById("item-price");
  const taxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  itemPrice.addEventListener("keyup", () => {
    const itemPriceNum = Number(itemPrice.value);
    const taxPriceInt = Math.floor(itemPriceNum / 10);
    const profitInt = Math.floor(itemPriceNum * 9 / 10);
    taxPrice.innerHTML = taxPriceInt;
    profit.innerHTML = profitInt;
  });
}

window.addEventListener('load', calculate)