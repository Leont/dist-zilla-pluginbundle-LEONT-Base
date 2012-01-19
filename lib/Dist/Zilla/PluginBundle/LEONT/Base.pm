package Dist::Zilla::PluginBundle::LEONT::Base;
use strict;
use warnings;

use Moose;
use Dist::Zilla;
with qw/Dist::Zilla::Role::PluginBundle::Easy Dist::Zilla::Role::PluginBundle::PluginRemover Dist::Zilla::Role::PluginBundle::Config::Slicer/;

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
InstallGuide

PodSyntaxTests
PodCoverageTests
Test::Compile

NextRelease
CheckChangesHasContent
/;

my @bundles = qw/Git/;

sub configure {
	my $self = shift;

	$self->add_plugins(@plugins);
	$self->add_plugins([ ('Test::Kwalitee') x 2, $self->config_slice({skip_kwalitee => 'skiptest' })]);
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
    [CheckChangesHasContent]
    [@Git]

Note the absense of any module builder. It is intended to be used in combination with a bundle such as @Basic.

=begin Pod::Coverage

configure

=end Pod::Coverage

=cut
