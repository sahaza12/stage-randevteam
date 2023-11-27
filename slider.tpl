{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
{** 
 <script type="text/javascript">
  function db_menu_list_li_click1(url_var){window.location.assign(url_var);}
    function db_menu_list_over1(url_var,link_var){$('.db_menu_preview1 img').fadeOut(200,function(){$(this).attr('src',url_var).bind('onreadystatechange load',function(){if(this.complete)$(this).fadeIn(300);});});$('.db_menu_preview1 a').attr('href',link_var);$(".db_menu_list li1 a").removeClass("db_list_selected1_a");}
    $(function(){$(".db_menu_list1 li").hover(function(){$(this).addClass("db_list_selected1");$('.db_menu_list1 li').not(this).removeClass('db_list_selected1');$("a",this).toggleClass("db_list_selected1_a");});$(".db_menu_list1 li").mouseout(function(){$("a",this).toggleClass("db_list_selected1_a");});$(".db_menu_list1 li a").hover(function(){$(this).toggleClass("db_list_selected1_a");});$(".db_menu_list1 li a").mouseout(function(){$(this).toggleClass("db_list_selected1_a");});});/* ]]> */</script>
*}
<script type="text/javascript">
 /* <![CDATA[ */;
 function db_menu_list_li_click1(url_var) {
   window.location.assign(url_var);
 }
 
 function db_menu_list_over1(url_var, link_var) {
   $('.db_menu_preview1 img').fadeOut(200, function() {
     $(this).attr('src', url_var).bind('onreadystatechange load', function() {
       if (this.complete) $(this).fadeIn(300);
     });
   });
 
   $('.db_menu_preview1 a').attr('href', link_var);
   $(".db_menu_list1 li a").removeClass("db_list_selected1_a");
 }
 
 $(function() {
   $(".db_menu_list1 li").hover(function() {
     $(this).addClass("db_list_selected1");
     $('.db_menu_list1 li').not(this).removeClass('db_list_selected1');
     $("a", this).toggleClass("db_list_selected1_a");
   }, function() {
     $("a", this).toggleClass("db_list_selected1_a");
   });
 
   $(".db_menu_list1 li a").hover(function() {
     $(this).toggleClass("db_list_selected1_a");
   }, function() {
     $(this).toggleClass("db_list_selected1_a");
   });
 });
 /* ]]> */
 
 
 </script>            
 {if $homeslider.slides}
  <div class="row">
    <div class="slid col-md-2">
      <ul class="carousel-inner" role="listbox" aria-label="{l s='Carousel container' d='Shop.Theme.Global'}">
          {foreach from=$homeslider.slides item=slide name='homeslider'}
            {foreach from=$slide.title item=title}
            <div id="slider_row" class="row">
            <div id="top_column" class="center_column col-xs-12 col-sm-12">
            <div class="row db_menu" id="content_db_menu_desktop">
            <div class="col-md-10">
            <ul class="db_menu_list1">
              <li onclick="db_menu_list_li_click1('{$slide.url}')" onmouseenter="db_menu_list_over1('{$slide.image_url}')" class="">
              <a href="{$slide.url}" title="Nos drapeaux brodés" class="db_list_selected1_a">{$title}</a>
            </li>
            </ul>
            </div>
            </div>
            </div>
            </div>
            {/foreach}
          {/foreach}
        </ul>
    </div>
    <div class="col-md-8 db_menu_preview1" ><a href="/3-sigle-d-associations"> <img src="/modules/homeslider/images/cd1433392426dc4687b289c4f31ce6a2633b20e9_1.jpg" style="display: inline; width: 115%; height: 459px;margin-left: -15px;" /> </a></div>
  </div>
{/if} 

<style>
.slid.col-md-2 {
    width: 31%;
    margin: inherit;
    margin-left: -40px;
}
.db_menu_list1 li a {
    font-family: Robotolight!important;
}
.db_menu_list1 a {
    color: #000000!important;
    text-decoration: none;
}
.db_menu_list1 {
    list-style: none;
    position: relative;
    /* width: 329px; */
    width: 111%;
    float: left;
    background-color: #e7ebec;
}
.db_menu_list1 li {
    border-bottom: 1px double white;
    color: #000000!important;
    font-size: 18px;
    font-weight: bold;
    line-height: 65.7px;
    position: relative;
    text-transform: uppercase;
    height: 65.7px;
    text-align: center;
}
.db_menu_list1 li.db_list_selected1 a, input::placeholder {
    color: #ffffff!important;
    font-weight: bold;
}
.db_list_selected1 {
    background-color: black!important;
    color: #e7ebec;
}
.db_list_selected1 a{
    color: #e7ebec;
}
.db_menu_list1 li:hover {
  background-color: #000000!important;
  color: white!important;
}

.db_menu_list1 a:hover {
  color: white!important;
}
</style>

{*

 {if $homeslider.slides}
  <ul class="carousel-inner" role="listbox" aria-label="{l s='Carousel container' d='Shop.Theme.Global'}">
      {foreach from=$homeslider.slides item=slide name='homeslider'}
            <figure>
              <img class="droit"style="display:none" src="{$slide.image_url}" alt="{$slide.legend|escape}" loading="lazy" width="1110" height="340">
                <figcaption class="caption">
                {foreach from=$slide.title item=title}
                  <h2 ><a href="{$slide.url}">{$title}</a></h2>
                {/foreach}
                </figcaption>
      {/foreach}
    </ul>
{/if} 

*} 



