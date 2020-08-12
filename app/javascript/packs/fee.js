window.addEventListener("turbolinks:load", ()=> {
  const price =  document.getElementById("item-price")
  const fee = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  price.addEventListener("input", ()=> {
    const input = document.getElementById("item-price").value
    fee.innerHTML = Math.floor(input * 0.1)
    profit.innerHTML = Math.floor(input * 0.9)
  })
})