<div id='order-items'>

  <h3>{l s='Order items'}</h3>

  <table>
    {foreach from=$order.products item=product}
      <tr>
        <td>
          <span class="product-image media-middle">
            <img class="" src="{$product.cover.medium.url}">
          </span>
        </td>
        <td>
          {$product.name}
          {foreach from=$product.attributes key="attribute" item="value"}
            - <span class="value">{$value}</span>
          {/foreach}
          {if $product.customizations|count}
            <div class="customizations">
              <ul>
                {foreach from=$product.customizations item="customization"}
                  <li>
                    {if $customization.down_quantity_url}
                      <a href="{$customization.down_quantity_url}" data-link-action="update-quantity">-</a>
                    {/if}
                    <span class="product-quantity">{$customization.quantity}</span>
                    {if $customization.up_quantity_url}
                      <a href="{$customization.up_quantity_url}" data-link-action="update-quantity">+</a>
                    {/if}
                    <a href="{$customization.remove_from_cart_url}" class="remove-from-cart" rel="nofollow">
                      {l s='Remove'}
                    </a>
                    <ul>
                      {foreach from=$customization.fields item="field"}
                        <li>
                          <label>{$field.label}</label>
                          {if $field.type == 'text'}
                            <span>{$field.text}</span>
                          {elseif $field.type == 'image'}
                            <img src="{$field.image.small.url}">
                          {/if}
                        </li>
                      {/foreach}
                    </ul>
                  </li>
                {/foreach}
              </ul>
            </div>
          {/if}
          {hook h='displayProductPriceBlock' product=$product type="unit_price"}
        </td>
        <td>{$product.quantity}</td>
        <td>{$product.price}</td>
      </tr>
    {/foreach}
  </table>

  <hr>

  <table>
    {foreach $order.subtotals as $subtotal}
      <tr>
        <td>{$subtotal.label}</td>
        <td>{$subtotal.value}</td>
      </tr>
    {/foreach}

    <tr>
      <td>{$total.label} {$tax_label}</td>
      <td>{$total.value}</td>
    </tr>
  </table>

</div>
