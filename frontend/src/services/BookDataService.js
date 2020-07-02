import http from "../http";

class BookDataService {
    getAll() {
        return http.get("/books");
    }

    get(id) {
        return http.get(`/books/${id}`);
    }

    findByAuthor(authorName) {
        return http.get(`/books/author/${authorName}`);
    }

    findByGenre(genreName) {
        return http.get(`/books/genre/${genreName}`);
    }

    create(data) {
        return http.post("/books", data);
    }

    update(id, data) {
        return http.put(`/books/${id}`, data);
    }

    delete(id) {
        return http.delete(`/books/${id}`);
    }
}

export default new BookDataService();
