function calculate() {
  const itemPrice = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');
  const tax = 0.1;

  itemPrice.addEventListener('change', () => {
    const price = itemPrice.value;
    addTaxPrice.innerHTML = price * tax;
    profit.innerHTML = price - (price * tax);
  });
}

window.addEventListener('turbo:load', calculate);
