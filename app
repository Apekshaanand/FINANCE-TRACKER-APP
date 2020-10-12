app/views/stocks/_list.html.erb
<div class="row">
  <div class="col-9">  
    <table class="table table-bordered table-hover">
      <thead>
        <tr>
          <th scope="col">Ticker</th>
          <th scope="col">Name</th>
          <th scope="col">Price</th>
          <th scope="col">Actions</th>
        </tr>
      </thead>
      <tbody>
        <% @tracked_stocks.each do |stock| %>
          <tr>
            <th scope="row"><%= stock.ticker %></th>
            <td><%= stock.name %></td>
            <td><%= stock.last_price %></td>
            <td><% if current_user.can_track_stock?(stock.ticker) %>
                  <%= link_to 'Add to portfolio', user_stocks_path(user: current_user, ticker: stock.ticker),
                                    class: "btn btn-xs btn-success", method: :post %>
                                    class: "btn btn-sm btn-success", method: :post %>
                <% elsif current_user.id != @user.id %>
                  <span class="badge badge-secondary">
                    You are already tracking
                    








app/views/users/_result.html.erb

<div class="results-block">
  <%= render 'layouts/messages' %>
</div>
<% if @stock %>
  <div class="card card-header results-block">
    <strong>Symbol: </strong> <%= @stock.ticker %>
    <strong>Name: </strong> <%= @stock.name %>
    <strong>Price: </strong> <%= @stock.last_price %>
    <% if current_user.can_track_stock?(@stock.ticker) %>
      <%= link_to 'Add to portfolio', user_stocks_path(user: current_user, ticker: @stock.ticker),
                                    class: "btn btn-xs btn-success", method: :post %>
                                    class: "btn btn-sm btn-success", method: :post %>
    <% else %>
      <span class="badge badge-secondary">
        You are already tracking
