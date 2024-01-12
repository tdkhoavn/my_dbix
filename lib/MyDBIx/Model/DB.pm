package MyDBIx::Model::DB;

use MyDBIx::Schema;
use DBIx::Class ();

use strict;

my ($schema_class, $connect_info);

BEGIN {
    $schema_class = 'MyDBIx::Schema';
    $connect_info = {
        dsn => 'dbi:mysql:database=my_dbix;host=127.0.0.1;port=3306',
        user => 'root',
        pass => 'Secret@12345'
    };
}

sub new {
    return __PACKAGE__->config ( $schema_class, $connect_info );
}

sub config {
    my $class = shift;

    my $self = {
        schema => shift,
        connect_info => shift,
    };

    my $dbh = $self->{schema}->connect(
        $self->{connect_info}->{dsn},
        $self->{connect_info}->{user},
        $self->{connect_info}->{pass},
    );

    return $dbh;
}

1;