@import com.example.demo.Book
@import com.example.demo.Author
@import java.util.List
@param List<Book> books

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Books List</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<div class="form-container">
    <h2>List of Books</h2>
    <table>
        <thead>
        <tr>
            <th>Title</th>
            <th>Author</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        @for(Book book : books)
            <tr>
                <td>${book.title}</td>
                <td>${book.author != null ? book.author.name : "Unknown"}</td>
                <td>
                    <a href="/books/edit/${book.id}">Edit</a> |
                    <form action="/books/delete/${book.id}" method="post" style="display:inline;">
                        <button type="submit" onclick="return confirm('Are you sure?')">Delete</button>
                    </form>
                </td>
            </tr>
        @endfor
        </tbody>
    </table>
    <div class="link">
        <a href="/books/create">Add New Book</a>
    </div>
</div>
</body>
</html>
