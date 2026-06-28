<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="com.foodexpress.model.Menu"%>

<%
ArrayList<Menu> menuList = (ArrayList<Menu>) request.getAttribute("menuList");
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Manage Menu</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{


background: linear-gradient(135deg, #FFF8F2, #FFE9D6);
    color: #2C2C2C;
    min-height:100vh;
    padding:30px;
    
}

h1{
    text-align:center;
    font-size:52px;
    font-weight:800;
    margin-bottom:10px;

    background:linear-gradient(135deg,#2563EB,#7C3AED);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

.subtitle{
    text-align:center;
    color:black;
    font-size:18px;
    margin-bottom:35px;
}

/* Table */

table{
    width:100%;
    border-collapse:collapse;
    background:white;

    border-radius:20px;
    overflow:hidden;

    box-shadow:
    0 15px 40px rgba(124,58,237,0.12);
}

th{
    background:linear-gradient(135deg,#2563EB,#7C3AED);
    color:white;

    padding:18px;
    font-size:15px;
    font-weight:700;
}

td{
    padding:18px;
    text-align:center;

    color:black;

    border-bottom:1px solid #E2E8F0;

    transition:0.3s;
}

tr:hover{
    background:#F8FAFC;
}

/* Category Badge */

.category{
    background:linear-gradient(135deg,#2563EB,#3B82F6);

    color:white;

    padding:8px 14px;

    border-radius:25px;

    font-weight:700;

    box-shadow:
    0 5px 15px rgba(59,130,246,0.25);
}

/* Available Badge */

.available{
    background:linear-gradient(135deg,#22C55E,#16A34A);

    color:white;

    padding:8px 14px;

    border-radius:25px;

    font-weight:700;

    box-shadow:
    0 5px 15px rgba(34,197,94,0.25);
}

/* Not Available Badge */

.not-available{
    background:linear-gradient(135deg,#EF4444,#DC2626);

    color:white;

    padding:8px 14px;

    border-radius:25px;

    font-weight:700;

    box-shadow:
    0 5px 15px rgba(239,68,68,0.25);
}

/* Edit Button */

.edit-btn{
    text-decoration:none;

    background:linear-gradient(135deg,#F59E0B,#FBBF24);

    color:white;

    padding:10px 16px;

    border-radius:10px;

    font-weight:700;

    margin-right:5px;

    transition:0.3s;
}

.edit-btn:hover{
    transform:translateY(-3px);

    box-shadow:
    0 10px 25px rgba(245,158,11,0.35);
}

/* Delete Button */

.delete-btn{
    text-decoration:none;

    background:linear-gradient(135deg,#EF4444,#DC2626);

    color:white;

    padding:10px 16px;

    border-radius:10px;

    font-weight:700;

    transition:0.3s;
}

.delete-btn:hover{
    transform:translateY(-3px);

    box-shadow:
    0 10px 25px rgba(239,68,68,0.35);
}

/* Home Button */

.btn-container{
    text-align:center;
}

.home-btn{
    display:inline-block;

    margin-top:30px;

    text-decoration:none;

    padding:14px 28px;

    border-radius:12px;

    background:linear-gradient(135deg,#2563EB,#7C3AED);

    color:white;

    font-size:16px;
    font-weight:700;

    transition:0.3s;
}

.home-btn:hover{
    transform:translateY(-3px);

    box-shadow:
    0 12px 25px rgba(124,58,237,0.35);
}

/* No Data */

.no-data{
    padding:25px;

    color:#EF4444;

    font-size:20px;
    font-weight:700;
}

/* Responsive */

@media(max-width:900px){

    body{
        padding:15px;
    }

    table{
        display:block;
        overflow-x:auto;
    }

    h1{
        font-size:40px;
    }
}
</style>

</head>
<body>

	<h1>Manage Menu</h1>

	<p class="subtitle">Manage all menu items from one place</p>

	<table>

		<tr>
			<th>Menu ID</th>
			<th>Restaurant ID</th>
			<th>Item Name</th>
			<th>Category</th>
			<th>Price</th>
			<th>Available</th>
			<th>Action</th>
		</tr>

		<%
		if (menuList != null && !menuList.isEmpty()) {

			for (Menu menu : menuList) {
		%>

		<tr>


			<td><%=menu.getMenuId()%></td>

			<td><%=menu.getRestaurantId()%></td>

			<td><%=menu.getItemName()%></td>
<td>
    <span class="category">🍽️ <%=menu.getCategory()%></span>
</td>

			<td>Rs. <%=menu.getPrice()%>
			</td>

			<td>
				<%
				if (menu.isAvailable()) {
				%> <span class="available"> ✅ Available </span> <%
 } else {
 %> <span class="not-available"> ❌ Not Available </span> <%
 }
 %>

			</td>

			<td><a class="edit-btn"
				href="editMenu?menuId=<%=menu.getMenuId()%>"> Edit </a> <a
				class="delete-btn" href="deleteMenu?menuId=<%=menu.getMenuId()%>">

					Delete </a></td>

		</tr>

		<%
		}
		} else {
		%>

		<tr>


			<td colspan="7" class="no-data">No Menu Items Found</td>

		</tr>

		<%
		}
		%>

	</table>

	<div class="btn-container">

		<a class="home-btn" href="home.jsp">🏠 Back To Home</a>

	</div>

</body>
</html>
