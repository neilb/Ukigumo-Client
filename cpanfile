requires 'LWP::UserAgent' => 6;
requires 'JSON' => 2;
requires 'Mouse' => 0;
requires 'File::HomeDir' => 0;
requires 'String::IRC' => 0;
requires 'Ukigumo::Common' => 0.03;
requires 'Time::Piece' => '1.15';
requires 'Capture::Tiny' => 0;
requires 'Encode::Locale' => 0;
requires 'URI::Escape' => 0;
requires 'YAML::Tiny' => 0;
requires 'HTTP::Request::Common';

recommends 'Growl::Any';

on configure => sub {
    requires 'perl', '5.008001';
    requires 'CPAN::Meta';
    requires 'CPAN::Meta::Prereqs';
    requires 'Module::Build', '0.40';
};

on test => sub {
    requires 'Test::More', "0.98";
    requires 'Test::Requires';
};
