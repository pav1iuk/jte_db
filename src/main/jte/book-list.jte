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
    <form action="/books/search" method="get" class="search-form">
        <input type="text" name="query" placeholder="Search by title or author..." required>
        <button type="submit">Search</button>
    </form>
    <div class="sort-buttons" style="margin-top: 15px;">
        <form action="/books" method="get" style="display:inline;">
            <input type="hidden" name="sort" value="asc">
            <button type="submit" class="sort-button">Sort A–Z</button>
        </form>
        <form action="/books" method="get" style="display:inline;">
            <input type="hidden" name="sort" value="desc">
            <button type="submit" class="sort-button">Sort Z–A</button>
        </form>
    </div>

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
                    <form action="/books/edit/${book.id}" method="get" style="display:inline;">
                        <button type="submit" class="edit-button">Edit</button>
                    </form>
                    <form action="/books/delete/${book.id}" method="post" style="display:inline;">
                        <button type="submit" class="delete-button">Delete</button>
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
