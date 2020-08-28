name := "hello"
enablePlugins(ScalaNativePlugin)
scalaVersion := "2.11.8"
scalacOptions ++= Seq("-feature")
nativeMode := "debug"
nativeGC := "immix"