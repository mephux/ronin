#
# Ronin - A decentralized repository for the storage and sharing of computer
# security advisories, exploits and payloads.
#
# Copyright (c) 2007 Hal Brodigan (postmodern at users.sourceforge.net)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#

require 'parameters'

require 'og'

module Ronin
  module Payloads
    class Payload

      include Parameters

      # Name of the specific payload
      attr_accessor :name, String

      # Version of the payload
      attr_accessor :version, String

      # Author(s) of the payload
      many_to_many :authors

      def initialize(&block)
	@name = ""
	@version = ""
	@authors = []
	@data = ""

	block.call(self) if block
      end

      def builder(&block)
	@build_block = block
      end

      def build
	@data = ""

	@build_block.call(self) if @build_block
      end

      def cleaner(&block)
	@clean_block = block
      end

      def clean
	@clean_block.call(self) if @clean_block

	@data = ""
      end

    end
  end
end
