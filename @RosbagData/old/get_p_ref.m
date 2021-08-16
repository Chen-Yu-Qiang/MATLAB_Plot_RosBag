function output = get_p_ref(self)
self.p_ref.topicName="ref";
self.p_ref.showName="p_{ref}";
self.p_ref.readFromGeom_Twist(self);
output = 1;
end
