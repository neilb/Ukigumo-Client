# NAME

Ukigumo::Client - Client library for Ukigumo

# SYNOPSIS

    use Ukigumo::Client;
    use Ukigumo::Client::VC::Git;
    use Ukigumo::Client::Executor::Auto;
    use Ukigumo::Client::Notify::Debug;
    use Ukigumo::Client::Notify::Ikachan;

    my $app = Ukigumo::Client->new(
        vc   => Ukigumo::Client::VC::Git->new(
            branch     => $branch,
            repository => $repo,
        ),
        executor   => Ukigumo::Client::Executor::Perl->new(),
        server_url => $server_url,
        project    => $project,
    );
    $app->push_notifier(
        Ukigumo::Client::Notify::Ikachan->new(
            url     => $ikachan_url,
            channel => $ikachan_channel,
        )
    );
    $app->run();

# DESCRIPTION

Ukigumo::Client is client library for Ukigumo.

# ATTRIBUTES

- `workdir`

    Working directory for the code. It's `$ENV{HOME}/.ukigumo/work/$project/$branch` by default.

- `project`

    Its' project name. This is a mandatory parameter.

- `logfh`

    Log file handle. It's read only parameter.

- `server_url`

    URL of the Ukigumo server. It's required.

- `user_agent`

    instance of [LWP::UserAgent](http://search.cpan.org/perldoc?LWP::UserAgent). It's have a default value.

- `vc`

    This is a version controller object. It's normally Ukigumo::Client::VC::\*. But you can write your own class.

    VC::\* objects should have a following methods:

        get_revision branch repository

- `executor`

    This is a test executor object. It's normally Ukigumo::Client::Executor::\*. But you can write your own class.

- `notifiers`

    This is a arrayref of notifier object. It's normally Ukigumo::Client::Notify::\*. But you can write your own class.

# METHODS

- $client->push\_notifier($notifier : Ukigumo::Client::Notify)

    push a notifier object to $client->notifiers.

- $client->run()

    Run a test context.

- $client->send\_to\_server($status: Int)

    Send a notification to the sever.

- $client->tee($command: Str)

    This method runs `$command` and tee the output of the STDOUT/STDERR to the `logfh`.

    _Return_: exit code by the `$command`.

- $client->log($message)

    Print `$message` and write to the `logfh`.

# AUTHOR

Tokuhiro Matsuno <tokuhirom AAJKLFJEF@ GMAIL COM>

# SEE ALSO

[Ukigumo::Server](http://search.cpan.org/perldoc?Ukigumo::Server), [Ukigumo:https://github.com/ukigumo/](Ukigumo:https://github.com/ukigumo/)

# LICENSE

Copyright (C) Tokuhiro Matsuno

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
