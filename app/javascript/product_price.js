const priceInput = document.getElementById("item-price");

priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  if (!isNaN(inputValue)) {
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1);

  const addTaxValue = addTaxDom.innerHTML;
  const salesProfit = document.getElementById("profit");
  salesProfit.innerHTML = inputValue - addTaxValue
  }
});