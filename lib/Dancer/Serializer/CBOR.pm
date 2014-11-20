package Dancer::Serializer::CBOR;

use strict;
use warnings;
use Carp;
use Dancer::ModuleLoader;
use Dancer::Exception qw(:all);
use base 'Dancer::Serializer::Abstract';

=head1 NAME

Dancer::Serializer::CBOR - serializer for handling CBOR data

=head1 VERSION

Version 0.100

=cut

our $VERSION = '0.100';

=head1 SYNOPSIS

    use Dancer;
    
    set serializer => 'CBOR';
    
    get '/view/user/:id' => sub {
        my $id = params->{'id'};
        return { user => get_id($id) };
    };

=head1 DESCRIPTION

This serializer allows to serialize and deserialize automatically the CBOR (Concise Binary Object Representation) structure.

=head1 METHODS

=cut

# helpers

sub loaded { Dancer::ModuleLoader->load('CBOR::XS') }

sub init {
    my ($self) = @_;
    raise core_serializer => 'CBOR::XS is needed and is not installed'
      unless $self->loaded;
}

=head2 serialize

Serialize a data structure to a concise binary object representation.

=cut

sub serialize {
    my ($self, $entity) = @_;
    CBOR::XS::encode_cbor($entity);
}

=head2 deserialize

Deserialize a concise binary object representation to a data structure.

=cut

sub deserialize {
    my ($self, $content) = @_;
    CBOR::XS::decode_cbor($content);
}

=head2 content_type

Return 'application/cbor'

=cut

sub content_type {'application/cbor'}

=head1 SEE ALSO

=over 4

=item * L<CBOR::XS>

=back

=head1 AUTHOR

David Zurborg, C<< <zurborg@cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests at L<https://github.com/zurborg/libdancer-serializer-cbor-perl/issues/new>.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Dancer::Serializer::CBOR

You can also look for information at:

=over 4

=item * GitHub: Public repository of the module

L<https://github.com/zurborg/libdancer-serializer-cbor-perl>

=back

=head1 COPYRIGHT & LICENSE

Copyright 2014 David Zurborg, all rights reserved.

This program is released under the ISC license.

=cut

1;
