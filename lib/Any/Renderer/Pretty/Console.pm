package Any::Renderer::Pretty::Console;

use 5.010001;
use strict;
use warnings;

use Data::Format::Pretty::Console qw(format_pretty);

# VERSION

sub new {
    my ($class, $format, $options) = @_;
    die "Invalid format $format" unless $format eq 'Pretty::Console';
    bless {options=>$options}, $class;
}

sub render {
    my ($self, $data) = @_;
    format_pretty($data, $self->{options});
}

sub requires_template {
    0;
}

sub available_formats {
    ['Pretty::Console'];
}

1;
# ABSTRACT: Render data structures through Data::Format::Pretty::Console

=head1 SYNOPSIS

 use Any::Renderer;

 my %options = (table_column_orders => [[qw/a b/]]);
 my $format  = "Pretty::Console";
 my $r = Any::Renderer->new($format, \%options);

 my $data_structure = [...]; # arbitrary structure
 my $string = $r->render($data_structure);


=head1 DESCRIPTION

Any::Renderer::Pretty::Console renders any Perl data structure passed to it with
L<Data::Format::Pretty::Console>. For example:


=head1 METHODS

=head2 new($format, \%options)

$format must be "Pretty::Console". See L</OPTIONS> for valid \%options.

=head2 $r->render($data_structure) => STRING


=head2 FUNCTIONS

None is exported.

=head2 requires_template($format) => BOOL

Will return false.

=head2 available_formats() => ARRAYREF

Will return ['Pretty::Console'].


The main method.


=head1 OPTIONS

Options are format_pretty() options. See L<Data::Format::Pretty::Console> for
available options.


=head1 SEE ALSO

L<Data::Format::Pretty::Console>

=cut
