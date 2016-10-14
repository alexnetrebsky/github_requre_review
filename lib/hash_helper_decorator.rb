class HashHelperDecorator < SimpleDelegator
  def initialize(hash, no_key_handler = -> {})
    hash.to_hash
    @no_key_handler = no_key_handler
    super(hash)
  end

  def get_by_path(path)
    result = self.to_hash
    path.split('/').each do |path_item|
      result = result.fetch(path_item) {
        @no_key_handler.call(path)
      }
    end
    result
  end

  def to_hash_helper
    self
  end
end