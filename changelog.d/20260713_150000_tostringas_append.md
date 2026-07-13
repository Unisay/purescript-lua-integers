### Changed

- `toStringAs` accumulates digits by appending and reverses the joined
  string once, instead of shifting the whole digit table on every
  iteration with `table.insert(t, 1, …)`. Same output; about 1.5× faster
  on 31-digit binary rendering (Int digit counts are bounded, so this is a
  constant-factor win).
