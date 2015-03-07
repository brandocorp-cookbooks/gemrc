# gemrc-cookbook

This cookbook provides a set of LWRPs for creating and managing gemrc files.

## Supported Platforms

All linux platform flavors should be supported. Please report any issues.

## Usage

Include `gemrc` in your node's `run_list` or your cookbook's dependency list:

```json
{
  "run_list": [
    "recipe[gemrc::default]"
  ]
}
```

OR

```ruby
depends 'gemrc'
```

## Resource/Provider

### gemrc

Creates a gemrc file for a specified user.

#### Actions

This resource supports the following actions:

<table>
  <tr>
    <th>Action</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><code>:create</code></td>
    <td>Default. Use to create a gemrc file. If the file already exists (but does not match), use to update that file to match.</td>
  </tr>
  <tr>
    <td><code>:delete</code></td>
    <td>Use to delete a gemrc file</td>
  </tr>
</table>

#### Attributes

This resource has the following attributes:

<table>
  <tr>
    <th>Attribute</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>user</td>
    <td></b>Required</b> The user to which the gemrc file will belong</td>
  </tr>
  <tr>
    <td>source</td>
    <td>An optional custom template source to use in place of the standard template source</td>
  </tr>
  <tr>
    <td>sources</td>
    <td>An <code>Array</code> of remote gem repositories</td>
  </tr>
  <tr>
    <td>verbose</td>
    <td>Verbosity of the gem command. false, true, and :really are the allowed levels</td>
  </tr>
  <tr>
    <td>update_source</td>
    <td>Enable/disable automatic updating of repository metadata</td>
  </tr>
  <tr>
    <td>backtrace</td>
    <td>Print backtrace when RubyGems encounters an error</td>
  </tr>
  <tr>
    <td>gempath</td>
    <td>An <code>Array</code> of paths in which to look for gems</td>
  </tr>
  <tr>
    <td>disable_default_gem_server</td>
    <td>Force specification of gem server host on push</td>
  </tr>
  <tr>
    <td>command_options</td>
    <td>An optional <code>Hash</code> containing <code>String</code> keys, each representing a gem command, with <code>String</code> values containing arguments for the specified gem command</td>
  </tr>
</table>

#### Example

```ruby
gemrc "vagrant" do
  backtrace "true"
  verbose "true"
  command_options {
    "install" => "--no-rdoc --no-ri",
    "update" => "--no-rdoc --no-ri"
  }
end
```

### system_gemrc

Creates a system-wide gemrc file.

#### Actions

This resource supports the following actions:

<table>
  <tr>
    <th>Action</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><code>:create</code></td>
    <td>Default. Use to create the system's gemrc file. If the file already exists (but does not match), use to update the file to match.</td>
  </tr>
  <tr>
    <td><code>:delete</code></td>
    <td>Use to delete the system's gemrc file</td>
  </tr>
</table>

#### Attributes

This resource has the following attributes:

<table>
  <tr>
    <th>Attribute</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>path</td>
    <td>The path to the system gemrc file. Defaults to `/etc/gemrc`.</td>
  </tr>
  <tr>
    <td>source</td>
    <td>An optional custom template source to use in place of the standard template source</td>
  </tr>
  <tr>
    <td>sources</td>
    <td>An <code>Array</code> of remote gem repositories</td>
  </tr>
  <tr>
    <td>verbose</td>
    <td>Verbosity of the gem command. false, true, and :really are the allowed levels</td>
  </tr>
  <tr>
    <td>update_source</td>
    <td>Enable/disable automatic updating of repository metadata</td>
  </tr>
  <tr>
    <td>backtrace</td>
    <td>Print backtrace when RubyGems encounters an error</td>
  </tr>
  <tr>
    <td>gempath</td>
    <td>An <code>Array</code> of paths in which to look for gems</td>
  </tr>
  <tr>
    <td>disable_default_gem_server</td>
    <td>Force specification of gem server host on push</td>
  </tr>
  <tr>
    <td>command_options</td>
    <td>An optional <code>Hash</code> containing <code>String</code> keys, each representing a gem command, with <code>String</code> values containing arguments for the specified gem command</td>
  </tr>
</table>

#### Example

```ruby
system_gemrc "update system-wide gemrc" do
  source 'my_gemrc_template.erb'
  sources ["https://gems.example.com", "https://gems.company.com"]
  backtrace "true"
  command_options {
    "install" => "--no-rdoc --no-ri",
  }
end
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Brandon Raabe (<brandocorp@gmail.com>)
