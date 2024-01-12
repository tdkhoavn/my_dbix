package MyDBIx;
use Mojo::Base 'Mojolicious', -signatures;
use MyDBIx::Model::DB;

# This method will run once at server start
sub startup ($self) {
    $self->_set_db_operation_handler();

    # Load configuration from config file
    my $config = $self->plugin('NotYAMLConfig');

    # Configure the application
    $self->secrets( $config->{secrets} );

    # Router
    my $r = $self->routes;

    # Normal route to controller
    # $r->get('/')->to('Example#welcome');
    $r->get('/books')->to('Books#list_books');
}


sub _set_db_operation_handler {
    my $self = shift;
    $self->{_dbh} = MyDBIx::Model::DB->new();
    return $self;
}
1;
