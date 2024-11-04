function setupSort(){
  $(".sortable").sortable({
    placeholder: "sortable-placeholder sortable-item",
    forcePlaceholderSize: true,
    start: function(e, ui){
      // change css here
      ui.item.addClass("sortable-active");
      $(".sortable-item").css("cursor", "move");
      // console.log("start")
    },
    stop: function(e, ui) {
      // change css here
      ui.item.removeClass("sortable-active");
      $(".sortable-item").css("cursor", "grab");
      // console.log("stop")
    },
    update: function(e, ui) {
      $.ajax({
        url: $(this).data("url"),
        type: "PATCH",
        data: $(this).sortable('serialize'),
      });
    }
  });
}

$(function(){
  setupSort(); 
})

/*
IN VIEW:
<div class="sortable" data-url="<%= sort_items_path %>">
<% @items.each do |item| %>
    <div id= <%= dom_id(item) %>>
      <%= item.name %>
    </div>
<% end %>

IN ROUTES:
resources :items do
  collection do
    patch :sort 
  end
end

IN CONTROLLER:
def sort
  params[:item].each_with_index do |id, index|
      Item.where(id: id).update_all(position: index + 1)
  end 
end
*/