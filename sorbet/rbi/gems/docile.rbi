# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/docile/all/docile.rbi
#
# docile-1.3.1

module Docile
  def dsl_eval(dsl, *args, &block); end
  def dsl_eval_immutable(dsl, *args, &block); end
  def dsl_eval_with_block_return(dsl, *args, &block); end
  def self.dsl_eval(dsl, *args, &block); end
  def self.dsl_eval_immutable(dsl, *args, &block); end
  def self.dsl_eval_with_block_return(dsl, *args, &block); end
  extend Docile::Execution
end
module Docile::Execution
  def exec_in_proxy_context(dsl, proxy_type, *args, &block); end
  def self.exec_in_proxy_context(dsl, proxy_type, *args, &block); end
end
class Docile::FallbackContextProxy
  def initialize(receiver, fallback); end
  def instance_variables; end
  def method_missing(method, *args, &block); end
end
class Docile::ChainingFallbackContextProxy < Docile::FallbackContextProxy
  def method_missing(method, *args, &block); end
end
