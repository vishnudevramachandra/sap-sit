module.exports = cds.service.impl(function() {
  const { Purchases } = this.entities;

  this.before('CREATE', Purchases, (req) => {
    if (req.data.quantity <= 0) {
      req.error(400, 'Quantity must be greater than zero');
    }
  });

  this.after('CREATE', Purchases, async (req) => {
    // Logic to handle after order creation, e.g., logging or notifications
  });
});
