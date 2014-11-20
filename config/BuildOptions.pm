%BuildOptions = (%BuildOptions,
    NAME                => 'Dancer::Serializer::CBOR',
    DISTNAME            => 'Dancer-Serializer-CBOR',
    AUTHOR              => 'David Zurborg <zurborg@cpan.org>',
    VERSION_FROM        => 'lib/Dancer/Serializer/CBOR.pm',
    ABSTRACT_FROM       => 'lib/Dancer/Serializer/CBOR.pm',
    LICENSE             => 'ISC',
	META_MERGE          => {
		resources => {
			homepage   => 'https://metacpan.org/release/Dancer-Serializer-CBOR',
			repository => 'https://github.com/zurborg/libdancer-serializer-cbor-perl.git',
			bugtracker => 'https://github.com/zurborg/libdancer-serializer-cbor-perl/issues',
		},
	},
    PL_FILES            => {},
    PMLIBDIRS           => [qw[ lib ]],
    PREREQ_PM           => {
        'Test::More'        => 0,
		'Modern::Perl'      => 0,
    },
    dist                => {
        COMPRESS            => 'gzip -9f',
        SUFFIX              => 'gz',
        CI                  => 'git add',
        RCS_LABEL           => 'true',
    },
    clean               => { FILES => 'Dancer-Serializer-CBOR-*' },
    depend              => {
		'$(FIRST_MAKEFILE)' => 'config/BuildOptions.pm',
    },
);
