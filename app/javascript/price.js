function sellPrice() {
  const price = document.getElementById("item-price");
  price.addEventListener("input", (e) => {
    console.log(price.value)
    const tax = document.getElementById("add-tax-price");
    console.log(price.value * 0.1)
    tax.innerText = price.value * 0.1
    const saleProfit = document.getElementById("profit");
    console.log(price.value - price.value * 0.1)
    saleProfit.innerText = price.value - price.value * 0.1
  });
}
window.addEventListener("turbolinks:load", sellPrice);