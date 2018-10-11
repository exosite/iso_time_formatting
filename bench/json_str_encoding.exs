
data = "lnkjsfasadf\"safdasfdsaF\"as;fas;flj;alkdsjfa;kdslfjal;jsfenoaspdf\asf;lkas;fjklas;jfdsadf\"safas;fljlkj\"sadfasffffffffffasdfsafd56789"

jiffy = fn ->
  Enum.reduce(1..1000, data, fn _, acc ->
    :jiffy.encode(acc, [:use_nil])
    <<?a, acc::binary>>
  end)
end

inspect = fn ->
  Enum.reduce(1..1000, data, fn _, acc ->
    inspect(acc)
    <<?a, acc::binary>>
  end)
end

severity = "asf"

string_obj = fn ->
  Enum.map(1..1000, fn numb ->
    numb = Integer.to_string(numb)
    "{\"type\":\"call\",\"severity\":\"" <> severity <>
    "\",\"timestamp\":" <> numb <>
    ",\"elapsed\":" <> numb <>
    ",\"tracking_id\":\"" <> severity <>
    "\",\"solution_id\":\"" <> severity <>
    "\",\"service\":\"" <> severity <>
    "\",\"service_type\":\"" <> severity <>
    "\",\"event\":\"" <> severity <>
    "\",\"message\":" <> numb <>
    ",\"code\":" <> numb <>
    ",\"data\":{" <>
    "\"processing_time\":" <> numb <>
    ",\"data_in\":" <> numb <>
    ",\"data_out\":" <> numb <>
    "}}"
  end)
end

list_obj = fn ->
  Enum.map(1..1000, fn numb ->
    numb = Integer.to_string(numb)
    <<"{\"type\":\"call\",\"severity\":\"",severity::binary,"\",\"timestamp\":",numb::binary,",\"elapsed\":",numb::binary,",\"tracking_id\":\"",severity::binary,"\",\"solution_id\":\"",severity::binary,"\",\"service\":\"",severity::binary,"\",\"service_type\":\"",severity::binary,"\",\"event\":\"",severity::binary,"\",\"message\":",numb::binary,",\"code\":",numb::binary,",\"data\":{\"processing_time\":",numb::binary,",\"data_in\":",numb::binary,",\"data_out\":",numb::binary,"}}">>
  end)
end

jiffy_obj = fn ->
  Enum.map(1..1000, fn numb ->
    numb = Integer.to_string(numb)
    :jiffy.encode(%{"type" => "call",
    "severity" => severity,
    "timestamp" => numb,
    "elapsed" => numb,
    "tracking_id" => severity,
    "solution_id" => severity,
    "service" => severity,
    "service_type" => severity,
    "event" => severity,
    "message" => numb,
    "code" => numb,
    "data" => %{
      "processing_time" => numb,
      "data_in" => numb,
      "data_out" => numb,
    }}, [:use_nil])
  end)
end

inspect_obj = fn ->
  Enum.map(1..1000, fn numb ->
    numb = Integer.to_string(numb)
    inspect(%{"type" => "call",
    "severity" => severity,
    "timestamp" => numb,
    "elapsed" => numb,
    "tracking_id" => severity,
    "solution_id" => severity,
    "service" => severity,
    "service_type" => severity,
    "event" => severity,
    "message" => numb,
    "code" => numb,
    "data" => %{
      "processing_time" => numb,
      "data_in" => numb,
      "data_out" => numb,
    }})
  end)
end

# Start benchmark
Benchee.run(%{
  "jiffy" => jiffy_obj,
  "inspect" => inspect_obj,
  "list" => list_obj,
  "string" => string_obj
}, time: 10, formatter_options: %{console: %{extended_statistics: true}})