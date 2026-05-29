#!/usr/bin/env -S jq -rf
def fmt(n):
  if n >= 1000000 then "\(n/100000|floor/10)M"
  elif n >= 1000 then "\(n/100|floor/10)k"
  else n|tostring end;

def c(code; t): "[\(code)m\(t)[0m";

[ c(36; "Model: \(.model.display_name)")
, if .effort.level then c(35; "Thinking: \(.effort.level)") else empty end
, c(33; "Ctx: \(fmt(.context_window.total_input_tokens // 0))")
] | join("  ")
