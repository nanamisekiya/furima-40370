const price = () => {
const priceInput = document.getElementById("item-price");

priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  if (!isNaN(inputValue)) {
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1);

  const addTaxValue = addTaxDom.innerHTML;
  const salesProfit = document.getElementById("profit");
  salesProfit.innerHTML = Math.floor(inputValue - addTaxValue);
  }
})};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);