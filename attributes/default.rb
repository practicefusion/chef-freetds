#
# Cookbook Name:: freetds
# Attributes:: default
#
# Copyright (C) 2013 Olivier Brisse
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['freetds']['install_method'] = 'package'
default['freetds']['version']        = '0.91'
default['freetds']['checksum']       = '6a8148bd803aebceac6862b0dead1c5d9659f7e1038993abfe0ce8febb322465'
default['freetds']['packages']       = %w(freetds-bin freetds-dev)
default['freetds']['tds_version']    = '7.1'
default['freetds']['odbc']           = false
default['freetds']['text_size']      = 64_512
default['freetds']['client_charset'] = nil

case node['freetds']['install_method']
when 'package'
  default['freetds']['dir']          = '/etc/freetds'
when 'source'
  default['freetds']['dir']          = '/usr/local/etc'
end

default['freetds']['servers'] = [
  {
    'name' => 'egServer50',
    'description' => 'A typical Sybase server',
    'host' => 'symachine.domain.com',
    'port' => 5000,
    'tds_version' => '5.0'
  },
  {
    'name' => 'egServer70',
    'description' => 'A typical Microsoft server',
    'host' => 'ntmachine.domain.com',
    'port' => 1433,
    'tds_version' => '7.0',
    'client_charset' => 'UTF-8'
  }
]
