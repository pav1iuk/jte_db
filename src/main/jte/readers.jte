@import com.example.demo.Reader
@import com.example.demo.Book
@import java.util.List

@param List<Reader> readers

<!DOCTYPE html>
<html>
<head>
    <title>Readers</title>
</head>
<body>
<h1>List of Readers</h1>
<ul>
    @for (Reader reader : readers)
        <li>
            ${reader.name} - Books:
            <ul>
                @for (Book book : reader.books)
                    <li>${book.title} by ${book.author.name}</li>
                @endfor
            </ul>
        </li>
    @endfor
</ul>
</body>
</html>
