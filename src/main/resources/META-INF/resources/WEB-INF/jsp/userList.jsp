<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Users List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .table-container {
            overflow-x: auto;
            overflow-y: auto;
            max-height: 500px; /* Adjust the height as needed */
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
            color: #333;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .pagination {
            text-align: center;
            margin: 20px 0;
        }
        .pagination a {
            color: #007bff;
            padding: 10px 15px;
            text-decoration: none;
            border: 1px solid #007bff;
            border-radius: 5px;
            margin: 0 5px;
        }
        .pagination a:hover {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Users List</h2>
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Mobile</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${dbUserList}" var="user">
                        <tr>
                            <td>${user.name}</td>
                            <td>${user.email}</td>
                            <td>${user.mobile}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="pagination">
            <c>${currentPage+1}/${totalPages}</c>
        </div>
        <div class="pagination">
            <c:if test="${currentPage > 0}">
                <a href="?page=${currentPage - 1}">Previous</a>
            </c:if>
            <c:if test="${currentPage < totalPages - 1}">
                <a href="?page=${currentPage + 1}">Next</a>
            </c:if>
            <a href="?page=${0}">Go To First Page</a>
            <a href="?page=${totalPages-1}">Go To Last Page</a>
            <a href="add-user">Add User</a>
        </div>
    </div>
</body>
</html>
