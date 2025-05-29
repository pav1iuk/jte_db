@import com.example.demo.dto.BookDto
@import com.example.demo.Author
@import java.util.List
@param com.example.demo.dto.BookDto book
@param List<Author> authors

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Book</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<div class="form-container">
    <h2>Create Book</h2>
    <form action="/books/create" method="post">
        <input type="text" name="title" placeholder="Book Title" required>

        <select name="authorId" required>
            <option value="" disabled selected>Select Author</option>
            @for(Author author : authors)
                <option value="${author.id}">${author.name}</option>
            @endfor
        </select>

        <button type="submit">Create</button>
    </form>
    <div class="link">
        <a href="/books">Back</a>
    </div>
</div>
</body>
</html>
