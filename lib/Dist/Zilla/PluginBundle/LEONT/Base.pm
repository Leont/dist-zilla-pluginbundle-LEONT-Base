package Dist::Zilla::PluginBundle::LEONT::Base;
use strict;
use warnings;

use Dist::Zilla::PluginBundle::Git;

use Moose;
use Dist::Zilla;
with 'Dist::Zilla::Role::PluginBundle::Easy';

my @plugins = qw/
AutoPrereqs
MetaJSON
MetaResources
Repository
Bugtracker
MinimumPerl
Git::NextVersion

PodWeaver
PkgVersion

PodSyntaxTests
PodCoverageTests
Test::Kwalitee
Test::Compile

NextRelease
Signature
CheckChangesHasContent
/;

my @bundles = qw/Git/;

sub configure {
	my $self = shift;

	$self->add_plugins(@plugins);
	$self->add_bundle("\@$_") for @bundles;
	return;
}

1;

__END__

#ABSTRACT: Plugins LeonT uses regardless of build system

=head1 DESCRIPTION

Some plugins LEONT uses. It is equivalent to:

    [AutoPrereqs]
    [MetaJSON]
    [MetaResources]
    [Repository]
    [Bugtracker]
    [MinimumPerl]
    [Git::NextVersion]
    
    [PodWeaver]
    [PkgVersion]
    
    [PodSyntaxTests]
    [PodCoverageTests]
    [Test::Kwalitee]
    [Test::Compile]
    
    [NextRelease]
    [Signature]
    [CheckChangesHasContent]
    [@Git]

Note the absense of any module builder. It is intended to be used in combination with a bundle such as @Basic.

=begin Pod::Coverage

configure

=end Pod::Coverage

=cut
