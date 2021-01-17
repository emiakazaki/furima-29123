window.onload = function () {
// 金額を入力した数値をpriceInputという変数に格納する
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const value_result = inputValue * 0.1

const priceTax = document.getElementById("add-tax-price");
priceTax.innerHTML = (Math.floor(value_result));

const priceContent = document.getElementById("profit");
priceContent.innerHTML = (Math.floor(inputValue - value_result));
})
};
