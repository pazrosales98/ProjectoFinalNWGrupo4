<h1>Checkout</h1>
{{foreach items}}
  <section>
    <h2>{{invPrdDsc}}</h2>
    <p>Precio: {{total}}</p>
    <p>Cantidad: {{cartCtd}}</p>
</section>
{{endfor items}}

<form action="index.php?page=checkout_checkout" method="post">
  <button type="submit">Place Order</button>
</form>
