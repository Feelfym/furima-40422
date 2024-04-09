function calculate() {
  const itemPrice = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');
  const tax = 0.1;

  itemPrice.addEventListener('change', () => {
    const price = itemPrice.value;
    const commission = Math.floor(price * tax);
    addTaxPrice.innerHTML = commission;
    profit.innerHTML = price - commission;
  });
}

window.addEventListener('turbo:load', calculate);
window.addEventListener('turbo:render', calculate);
