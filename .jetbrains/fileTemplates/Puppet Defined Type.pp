# ${Puppet_defined_type}
#
# Short ${Puppet_defined_type} description.
#
# @author $USER 
#
# @example Using ${Puppet_defined_type}
#   ${Puppet_defined_type} { 'sample_name':
#     ensure => present,
#   }
#
# @param ensure Whether ${Puppet_defined_type} should exist
define ${Puppet_defined_type} (
  Enum[present, absent] ${DS}ensure = present,
) {

  #[[$END$]]#

}