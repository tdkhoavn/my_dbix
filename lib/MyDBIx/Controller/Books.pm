package MyDBIx::Controller::Books;
use Mojo::Base 'Mojolicious::Controller', -signatures;

sub list_books {
    my $self = shift;

    my @books = $self->app->{_dbh}->resultset('Book')->all();

    @books = map {{
        id => $_->id,
        name => $_->name,
        author_name => $_->author_name,
        price => $_->price,
    }} @books;

    $self->render(msg => 'List of books', books => \@books);
}

1;