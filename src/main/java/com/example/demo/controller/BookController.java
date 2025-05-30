package com.example.demo.controller;

import com.example.demo.dto.BookDto;
import com.example.demo.Author;
import com.example.demo.Book;
import com.example.demo.repository.AuthorRepository;
import com.example.demo.repository.BookRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

@Controller
public class BookController {
    private final BookRepository bookRepository;
    private final AuthorRepository authorRepository;

    public BookController(BookRepository bookRepository, AuthorRepository authorRepository) {
        this.bookRepository = bookRepository;
        this.authorRepository = authorRepository;
    }

    @GetMapping("/books/create")
    public String createBookForm(Model model) {
        model.addAttribute("book", new BookDto());
        model.addAttribute("authors", authorRepository.findAll());
        return "book-create";
    }

    @GetMapping("/books/search")
    public String searchBooks(@RequestParam("query") String query, Model model) {
        List<Book> results = bookRepository.findByTitleContainingIgnoreCaseOrAuthor_NameContainingIgnoreCase(query, query);
        model.addAttribute("books", results);
        return "book-list";
    }

    @GetMapping("/books")
    public String listBooks(
            @RequestParam(required = false) String sort,
            @RequestParam(required = false) String query,
            Model model) {

        List<Book> books;

        if (query != null && !query.isBlank()) {
            books = bookRepository.findByTitleContainingIgnoreCaseOrAuthor_NameContainingIgnoreCase(query, query);
        } else {
            books = (List<Book>) bookRepository.findAll();
        }

        if ("asc".equalsIgnoreCase(sort)) {
            books.sort(Comparator.comparing(book -> book.getTitle().toLowerCase()));
        } else if ("desc".equalsIgnoreCase(sort)) {
            books.sort(Comparator.comparing((Book book) -> book.getTitle().toLowerCase()).reversed());
        }

        model.addAttribute("books", books);
        model.addAttribute("query", query == null ? "" : query);
        model.addAttribute("sort", sort);
        return "book-list";
    }


    @GetMapping("/books/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Book book = bookRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid book Id:" + id));
        List<Author> authors = StreamSupport.stream(authorRepository.findAll().spliterator(), false)
                .collect(Collectors.toList());
        model.addAttribute("book", book);
        model.addAttribute("authors", authors);
        return "book-edit";
    }

    @PostMapping("/books/edit/{id}")
    public String updateBook(@PathVariable Long id,
                             @RequestParam String title,
                             @RequestParam Long authorId) {
        Book book = bookRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid book Id:" + id));
        Author author = authorRepository.findById(authorId).orElseThrow(() -> new IllegalArgumentException("Invalid author Id:" + authorId));
        book.setTitle(title);
        book.setAuthor(author);
        bookRepository.save(book);
        return "redirect:/books";
    }

    @PostMapping("/books/delete/{id}")
    public String deleteBook(@PathVariable Long id) {
        bookRepository.deleteById(id);
        return "redirect:/books";
    }

    @PostMapping("/books/create")
    public String createBook(@ModelAttribute BookDto bookDto) {
        Book book = new Book();
        book.setTitle(bookDto.getTitle());

        Author author = authorRepository.findById(bookDto.getAuthorId())
                .orElseThrow(() -> new IllegalArgumentException("Invalid author ID"));

        book.setAuthor(author);

        bookRepository.save(book);
        return "redirect:/books";
    }
}


