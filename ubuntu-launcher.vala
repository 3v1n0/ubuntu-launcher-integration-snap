namespace UbuntuSnappedLauncher {

  public static void main (string[] args)
  {
    Gtk.init (ref args);

    /* Pretend to be evolution for the sake of the example */
    var l = Unity.LauncherEntry.get_for_desktop_id ("ubuntu-launcher.desktop");

    /* Show a count of 124 on the icon */
    l.count = 124;
    l.count_visible = true;

    /* Set progress to 42% done */
    l.progress = 0.42;
    l.progress_visible = true;

    /* Set us as urgent. Quickly! Go! Go! Go! Now! Now! */
    l.urgent = true;

    /* We also want a quicklist */
    var ql = new Dbusmenu.Menuitem ();
    var item1 = new Dbusmenu.Menuitem ();
    item1.property_set (Dbusmenu.MENUITEM_PROP_LABEL, "Item 1");
    var item2 = new Dbusmenu.Menuitem ();
    item2.property_set (Dbusmenu.MENUITEM_PROP_LABEL, "Item 2");
    ql.child_append (item1);
    ql.child_append (item2);
    l.quicklist = ql;

    var win = new Gtk.Window();
    win.title = "Testing Ubuntu Launcher Integration!";
    win.window_position = Gtk.WindowPosition.CENTER;
    win.set_default_size (400, 50);
    win.destroy.connect (() => { Gtk.main_quit (); });
    win.show_all ();

    Gtk.main ();
  }
}
