use strict;
use warnings;
package Dancer::Serializer::CBOR;
# ABSTRACT: serializer for handling CBOR data

use Carp;
use Dancer::ModuleLoader;
use Dancer::Exception qw(:all);
use base 'Dancer::Serializer::Abstract';

# VERSION

=head1 SYNOPSIS

    use Dancer;
    
    set serializer => 'CBOR';
    
    get '/view/user/:id' => sub {
        my $id = params->{'id'};
        return { user => get_id($id) };
    };

=head1 DESCRIPTION

This serializer allows to serialize and deserialize automatically the CBOR (Concise Binary Object Representation) structure.

=cut

# helpers

sub loaded { Dancer::ModuleLoader->load('CBOR::XS') }

sub init {
    my ($self) = @_;
    raise core_serializer => 'CBOR::XS is needed and is not installed'
      unless $self->loaded;
}

=method serialize

Serialize a data structure to a concise binary object representation.

=cut

sub serialize {
    my ($self, $entity) = @_;
    CBOR::XS::encode_cbor($entity);
}

=method deserialize

Deserialize a concise binary object representation to a data structure.

=cut

sub deserialize {
    my ($self, $content) = @_;
    CBOR::XS::decode_cbor($content);
}

=method content_type

Return 'application/cbor'

=cut

sub content_type {'application/cbor'}

=head1 SEE ALSO

=over 4

=item * L<CBOR::XS>

=back

=cut

1;
