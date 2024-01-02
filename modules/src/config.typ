/// Deep merge of two dictionaries.
/// Note that dict2 takes precedence over dict1.
/// c.f. https://github.com/typst/typst/issues/1957
///
/// @param dict1 dictionary
/// @param dict2 dictionary
/// @return dictionary
#let deep-merge-pair(dict1, dict2) = {
  assert(type(dict1) == dictionary, message: "dict1 must be a dictionary")
  let final = dict1
    for (k, v) in dict2 {
      if (k in dict1) {
        if type(v) == dictionary {
          final.insert(k, deep-merge-pair(dict1.at(k), v))
        } else {
          final.insert(k, dict2.at(k))
        }
      } else {
        final.insert(k, v)
      }
    }
  final
}

/// Deep merge of dictionaries.
/// c.f. https://github.com/typst/typst/issues/1957
///
/// @return dictionary
#let deep-merge(..args) = {
  let final = args.pos().first()
    for dict in args.pos() {
      final = deep-merge-pair(final, dict)
    }
  final
}

#let config = deep-merge(toml("../config.toml"), toml("/config.toml"))
#let fonts = config.fonts
#let colors = config.colors
#config.remove("fonts")
#config.remove("colors")

// Final processing
// For example, convert string "10pt" to length, convert "#000000" to color
#{
  config.font-size = eval(config.font-size)
  config.spacing = config.spacing * config.font-size
}

/* vim: set ft=typst: */
