const pay = () => {
  const payjp = Payjp('pk_test_08021d73ec683b4ca61edaa8')
  const elements = payjp.elements()
  const numberElement = elements.create('cardNumber')
  const expElement = elements.create('cardExpiry')
  const cvcElement = elements.create('cardCvc')

  numberElement.mount('#number-form')
  expElement.mount('#expiry-form')
  cvcElement.mount('#cvc-form')

  const form = document.getElementById('charge-form')
  form.addEventListener('submit', (e) => {
    payjp.createToken(numberElement).then((response) => {
      if (response.error) {
        alert('カード情報が正しくありません。')
      } else {
        const token = response.id
        const renderDom = document.getElementById('charge-form')
        const tokenObj = `<input value=${token} name='token' type='hidden'>`
        renderDom.insertAdjacentHTML('beforeend', tokenObj)
      }
      numberElement.clear()
      expElement.clear()
      cvcElement.clear()
      document.getElementById('charge-form').submit()
    })
    e.preventDefault()
  })
}
window.addEventListener("turbo:load", pay);
