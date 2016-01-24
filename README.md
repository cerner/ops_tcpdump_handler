# About: ops_tcpdump_handler

This cookbook is for local testing purposes only. It installs and
configures tcpdump, then sets that up as a service to monitor traffic
during the chef run. At the end of the run, a handler will read and
print out the sniffed network traffic.
Inspired by [huchen](https://github.com/acrmp/huchen).


# Usage:

If you are using Berkshelf for dependency resolution add an entry in your Berksfile, probably in a group:
```
group :development do
  cookbook 'ops_tcpdump_handler'
end
```

Place the cookbook at the beginning of your local run_list. For example,
in vagrant:

```
cfg.vm.provision :chef_client do |chef|
  chef.add_recipe 'ops_tcpdump_handler'
  chef.add_recipe 'another_recipe'
end
```

Then, at the end of your run you should see something similar to:

```
...
==> node01: attempted to connect to: proxy06.fedoraproject.org using http
==> node01: attempted to connect to: mirror.sfo12.us.leaseweb.net using http
==> node01: attempted to connect to: li63-48.members.linode.com using https
==> node01: attempted to connect to: 23.235.40.133 using https
==> node01: attempted to connect to: github.com using https
==> node01: attempted to connect to: codeload.github.com using https
==> node01: attempted to connect to: s3-1.amazonaws.com using https
...
```

# Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)

# Warning

This is for local testing only. Do not apply this cookbook to a
production node.

If your cookbook relies on the [runit community cookbook](https://github.com/hw-cookbooks/runit) then any calls to the internet made by that cookbook will
not show up in the logs as runit has already been configure before this
service begins monitoring traffic.

# LICENSE

Copyright 2015 Cerner Innovation, Inc.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0 Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

