<h1><%= @game.player_1.name %> vs. <%= @game.player_2.name %></h1>
<div><%=@game.player_2.name%>: <%=@game.player_2.hp%>HP</div>
<div><%=@game.player_1.name%>: <%=@game.player_1.hp%>HP</div>
<form action='/computer_attack'>
  <input type='submit' value='Attack'>
</form>